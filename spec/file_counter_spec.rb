require_relative '../file_counter'
require 'fileutils'

RSpec.describe FileCounter do
  describe '#count_files' do
    let(:directory_testing) { 'spec/test_files' }

    before do
      FileUtils.mkdir_p(directory_testing)
    end

    after do
      FileUtils.rm_rf(directory_testing)
    end

    context 'files have identical content' do
      it 'detects identical content' do
        File.write("#{directory_testing}/file1.txt", 'yes it is!!')
        File.write("#{directory_testing}/file2.txt", 'yes it is!!')

        file_counter = FileCounter.new(directory_testing)
        expect { file_counter.count_files }.to output(/Identical content detected! It has 2 files/).to_stdout
      end
    end

    context 'no identical content files' do
      it 'reports no identical content' do
        File.write("#{directory_testing}/file1.txt", 'Hai hai hai!!!')
        File.write("#{directory_testing}/file2.txt", 'Hai haaii!!!')

        file_counter = FileCounter.new(directory_testing)
        expect { file_counter.count_files }.to output(/File with identical content not found/).to_stdout
      end
    end
  end
end
