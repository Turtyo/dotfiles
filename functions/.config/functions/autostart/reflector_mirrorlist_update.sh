#!/usr/bin/env bash

# Step 0: Define file paths
reflector_list=$(mktemp)
reflector_list_cut=$(mktemp)
tmp_mirrorlist_file=$(mktemp)

# Use the first argument as the mirrorlist_file, or default to /etc/pacman.d/mirrorlist
mirrorlist_file="${1:-/etc/pacman.d/mirrorlist_temp}"
old_mirrorlist_file="$mirrorlist_file.old"  # Backup mirrorlist file

## Backup to protect against wrong manipulations

cp "$mirrorlist_file" "$old_mirrorlist_file"
cat "$mirrorlist_file" >> "$tmp_mirrorlist_file"

# Step 1: Run reflector to generate a new mirrorlist
reflector -p https > "$reflector_list"

# Step 2: Extract the first 10 mirror URLs from the generated mirrorlist using regex
grep -oP '^Server = https://.*$' "$reflector_list" 2>/dev/null | head -n 10 > "$reflector_list_cut"
echo "" >> "$reflector_list_cut"

# Get the current date and time
current_datetime=$(date +"%Y-%m-%d at time %H:%M")

# Prepend the date and time to /tmp/reflector_list_cut
sed -i "1i##\n## Arch Linux repository mirrorlist\n## Generated on $current_datetime\n##\n" "$reflector_list_cut"

# Step 3: Update the temporary mirrorlist file using sed
sed -i '1,/^## Worldwide/{/^## Worldwide/!d}' "$tmp_mirrorlist_file"

# Append the new mirror URLs from /tmp/reflector_list_cut to the temporary mirrorlist file
echo "$(cat "$reflector_list_cut" "$tmp_mirrorlist_file")" > "$tmp_mirrorlist_file"

# Replace the original mirrorlist file with the temporary one
# cp instead of mv prevents the perms of the tmp files to overwrite the perms of original
cp "$tmp_mirrorlist_file" "$mirrorlist_file"

# Clean up temporary files
rm "$reflector_list"
rm "$reflector_list_cut"
rm "$tmp_mirrorlist_file"

