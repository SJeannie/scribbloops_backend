class DocumentsWarpController < ApplicationWarpController

  def index(params)
        Document.after_create do
            yield Document.all
        end
        Document.after_update do
            yield Document.all
        end
        Document.after_destroy do
            yield Document.all
        end
        yield Document.all
    end

    def show(params)
        Document.after_update do | document |
            if(params[:id] == document.id)
                yield Document.find(params[:id])
            end
        end
        yield Document.find(params[:id])
    end

    def create(params)
        yield Document.create(document_params)
    end

    def destroy(params)
        yield Document.destroy(params[:id])
    end

    def update(params)
        document = Document.find(params[:id])
        yield document.update(document_params)
    end

    private 
    def document_params
        params.permit(:title, :content, :portfolio_id)
    end


end