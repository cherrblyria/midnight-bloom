function gray
    set batch (string join "," (string split " " $argv))
    gowall effects grayscale --batch $batch
end
