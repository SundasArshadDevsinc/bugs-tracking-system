module BugsHelper
    def status_check(bug)
        Bug.statuses.keys.reject do |key|
          (key == 'completed' && bug.bug?) or (key == 'resolved' && bug.feature?)
        end
    end
end
