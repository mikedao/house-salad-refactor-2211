class SearchFacade
  def initialize(data)
    @state = data[:state]
  end

  def members
    json = service.members_by_state(@state)

    json[:results].map do |member_data|
      Member.new(member_data)
    end
  end

  def senators
    json = service.senators_by_state(@state)

    # create senator objects
  end

  def members_count
    all_members.count
  end

  def all_members
    @_all_members ||= members
  end

  def service
    @_service ||= CongressService.new
  end

  def democrats
    all_members.find_all do |member|
      member.party == "D"
    end
  end

  def republicans
    all_members.find_all do |member|
      member.party == "R"
    end
  end
end