component extends="testbox.system.BaseSpec" {

  public void function setUp() {
    myObj = createObject('component','eta.model.services.login');
  }

  public void function userIsActiveTest() {
    var result = myObj.isActive(321333);

    debug(result);

    $assert.isTrue(result);
  }

}
