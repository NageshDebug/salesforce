public with sharing class Order {
    public List<Product> products;
    public Boolean isCashbackAvailable;

    public void setProducts(List<Product> products){
        this.products=products;
    }

    public List<Product> getProducts(){
        return this.products;
    }

    public void isCashbackAvailable(Boolean isCashbackAvailable){
        this.isCashbackAvailable=isCashbackAvailable;
    }

    public Boolean isCashbackAvailable(){
        return this.isCashbackAvailable;
    }
}
