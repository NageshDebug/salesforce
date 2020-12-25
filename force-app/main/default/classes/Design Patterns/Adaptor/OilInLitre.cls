public virtual class OilInLitre implements OilInLitreInterface {
  public virtual Oil buyOil(double quantityInLitre) {
    System.debug('Purchasing ' + quantityInLitre + ' litres of Oil');
    return new Oil(quantityInLitre);
  }
}
