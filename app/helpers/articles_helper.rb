module ArticlesHelper
    #The class that passes the strong params to the create
  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end
end
