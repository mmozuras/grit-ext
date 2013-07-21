module Grit
  class Blob
    def id
      @repo.git.rev_parse({}, @id)
    end

    def create_tempfile
      file = Tempfile.new(id)
      file.write(data)
      file.close
      file
    end
  end
end
