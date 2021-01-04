@isTest
public class AdaptorClient {
  @isTest
  public static void test() {
      //Method-1
    OilInGallonInterface adapterInterfaceClass = new OilInGallonImplClass();
    adapterInterfaceClass.buyOilInGallon(1);
    adapterInterfaceClass.buyOilInGallon(10);

    //Method-2
    OilInGallonInterface adapterInterfaceObject = new OilInGallonImplObject();
    adapterInterfaceObject.buyOilInGallon(1);
    adapterInterfaceObject.buyOilInGallon(40);
  }
}