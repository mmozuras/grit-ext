module Grit
  class Blob
    def id
      @repo.git.rev_parse({}, @id)
    end
  end
end
