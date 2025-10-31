# Ensure required paths are present in $PATH
check_paths=(
  ~/go/bin
  ~/.sdks/gradle/bin
)

for p in "${check_paths[@]}"; do
  if [ -d "$p" ] && [[ ":$PATH:" != *":$p:"* ]]; then
    PATH="$p:$PATH"
  fi
done

export PATH
