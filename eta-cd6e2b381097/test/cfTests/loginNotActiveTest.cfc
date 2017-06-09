component extends="testbox.system.BaseSpec" {
  public void function setUp() {
    myObj = createObject('component','eta.model.services.Login');
  }

  public void function userIsActiveTest() {
    var result = myObj.isActive(999999);

    debug(result);

    $assert.isFalse(result);
  }

}
