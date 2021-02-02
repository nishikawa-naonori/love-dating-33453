
class SearchRomancesService
  def self.search(search)
    if search != ""
      search = "%#{search}%"
      @items = Romance.find_by_sql(["select * from romances where title like ? ", search])
    end 
    # if @items[0] == nil
    #   @items = Romance.all
    # end   


  end
end