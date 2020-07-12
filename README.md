To use this hook:

add the prepare-commit-msg file at .git/hooks/prepare-commit-msg and edit as needed

make it executable: chmod +x .git/hooks/prepare-commit-msg

that's it!

NOTE: after a failed merge from a forbidden branch, the working tree will still be in a MERGING state. To discard the local working copy state, 

run: git reset --merge
