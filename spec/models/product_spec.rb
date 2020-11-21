require 'rails_helper'

describe Product do
  describe '#create' do
    
    it "is valid with a product" do
      product = build(:product) 
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product, name: "") 
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end
    
    it "is invalid without a price" do
      product = build(:product, price: "") 
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a cost" do
      product = build(:product, cost: "") 
      product.valid?
      expect(product.errors[:cost]).to include("can't be blank")
    end

    it "is invalid without a status" do
      product = build(:product, status: "") 
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end

    it "is invalid without a size" do
      product = build(:product, size: "") 
      product.valid?
      expect(product.errors[:size]).to include("can't be blank")
    end

    it "is invalid without a description" do
      product = build(:product, description: "") 
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a prefecture_id" do
      product = build(:product, prefecture_id: "") 
      product.valid?
      expect(product.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_day" do
      product = build(:product, delivery_day: "") 
      product.valid?
      expect(product.errors[:delivery_day]).to include("can't be blank")
    end

    it "is invalid without a images" do
      product = build(:product, images: []) 
      product.valid?
      expect(product.errors.full_messages).to include("Images can't be blank")
    end
    
    it "is invalid without a category_id" do
      product = build(:product, category_id: "") 
      product.valid?
      expect(product.errors.full_messages).to include("Category must exist")
    end

    # nameが30文字より多い場合は登録できない
    it "is invalid without a name that has more than 30 characters" do
      product = build(:product, name: "お金持ちになれる黄金の羽の拾い方・金持ち父さん、貧乏父さん・人を動かす") 
      product.valid?
      expect(product.errors[:name]).to include("is too long (maximum is 30 characters)")
    end

    # descriptionが140字より多い場合は登録出来ない
    it "is invalid without a description that has more than 140 characters" do
      product = build(:product, description: "Rubyでプログラムを実行するときには、テキストエディタとターミナルの2つのアプリケーションを使います。
        ・テキストエディタは文字で書かれたファイル(テキストファイル)を作成・編集するためのアプリケーションです。メモ帳やWordもテキストエディタの一種です。より効率的にプログラミングをするために、エンジニアはプログラミング専用のテキストエディタを使います。
        ・ターミナルはテキストエディタで作成・編集したプログラムのファイルをコンピューターに読み込ませ、実行するためのアプリケーションです。プログラムが書かれたファイルはそのままではただ文字が書かれたファイルです。これをコンピューターに読み込ませることでプログラムとして実行できます。") 
      product.valid?
      expect(product.errors[:description]).to include("is too long (maximum is 140 characters)")
    end

  end

  describe '#search' do
    before do
      @product1 = FactoryBot.create(:product, name: "miuna")
      @product2 = FactoryBot.create(:product, name: "manaka")
      @product3 = FactoryBot.create(:product, name: "sayu")
    end

    # 検索内容がある場合
    context "search by name:'u'" do
      it "returns @product" do
        expect(Product.search("u")).to include(@product1)
      end

      it "doesn't returne @product2" do
        expect(Product.search("u")).to_not include(@product2)
      end
    end

    # 空で検索した場合
    context "search by 'Hikari'" do
      it "returns @product" do
        expect(Product.search("Hikari")).to be_empty
      end
    end

  end
end




