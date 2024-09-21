# FileCounter

`FileCounter` is a simple Ruby program designed to detect and count files with identical content within a specified directory. This project utilizes hashing algorithms to identify files that contain the same data.

## Features

- **Identical File Detection:** Counts files with identical content in the given directory.
- **Result Reporting:** Displays information about files with identical content and the content with the largest group of identical files.

## Requirements

- Ruby 2.5 or later
- Bundler (for dependency management)
- `rspec` gem for testing

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/hartatoadi/file_counter.git
   cd file_counter
2. Install the dependencies using Bundler:
   ```bash
   bundle install


## Usage

To detect identical files within a directory, run the following command:
  ```bash
  ruby file_counter.rb <path_to_folder>
  ```

## Running Tests

This project uses RSpec for testing. To run the tests, simply execute:

```bash
rspec
```

The tests will cover the following scenarios:

1. Detecting files with identical content
2. Reporting when no identical content is found

## Structure

1. file_counter.rb: The main file containing the logic for detecting identical files.
2. spec/file_counter_spec.rb: The test file that uses RSpec to ensure the program functions correctly.
3. Gemfile and Gemfile.lock: Manage project dependencies.

## Example Output

If identical content is found:
```typescript
Identical content detected! It has 2 files
Content with the largest number of identical files: a591a6d... with 2 files.
```

If no identical content is found:
```arduino
File with identical content not found.
```

## Contribution
If you wish to contribute, please create a pull request or open an issue in this repository.
