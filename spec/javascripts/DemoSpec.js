describe("Demo App", function() {
  var demo_app;

  beforeEach(function() {
    demo_app = new _jwui.app();
  });

  it("should define a demo app object", function() {
    expect(demo_app).toBeDefined();
  });
});