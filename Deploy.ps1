
# Define the paths to the src and test folders
$srcFolder = "src"
$testFolder = "test"

# Build the solution
dotnet build $srcFolder

# Run the tests
$testResult = dotnet test $testFolder --no-build

# Check if the tests passed
if ($testResult -like "*Failed*") {
    Write-Host "Tests failed. Aborting further actions."
} else {
    Write-Host "Tests passed. Building the application."

    # Build the application
    dotnet build $srcFolder -o

    # Check if the build succeeded
    if ($LastExitCode -eq 0) {
        Write-Host "Build succeeded. Running the application."
        # Run the application
        dotnet run --project $srcFolder
    } else {
        Write-Host "Build failed. Application not started."
    }
}
