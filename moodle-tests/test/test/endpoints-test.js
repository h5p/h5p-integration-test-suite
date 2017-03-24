const basePath = 'http://localhost';
const user = 'admin';
const pass = 'Admin';

fixture('Integration Test')
  .page(`${basePath}/login/index.php`);

test('Test endpoints through UI', async t => {

  // Enter login data
  await t.typeText('#username', user)
    .typeText('#password', pass)
    .click('#loginbtn');

  // Create course
  await t.navigateTo('http://localhost/course/modedit.php?add=hvp&type=&course=2&section=0&return=0&sr=0')
    .switchToIframe('.h5p-editor-iframe')
    .expect('.icon-hub-icon').ok('Hub is showing up')
    .click('.icon-hub-icon');

  // // Install library
  // await t.expect('.content-type-list li:first-child').ok('Content type list has at least one library')
  //   .click('.content-type-list li:first-child')
  //   .expect('.content-type-list .button.button-install').ok('Detailed view has an install button')
  //   .click('.content-type-list .button.button-install');
  //
  // // wait for content type to install
  // await t.wait(15000);
  //
  // // Check that install button is replaced by use button
  // await t.expect('.content-type-list .button.button-install').notOk('Detailed view should not have install button')
  //   .expect('.content-type-list .button.button-use').ok('Detailed viw should have a use button');
});
