const basePath = 'http://localhost';
const user = 'admin';
const pass = 'admin';

fixture('Drupal integration test')
  .page(basePath);

test('just checks if the page exists', async t => {

  // Enter login data
  await t.typeText('#edit-name', 'admin')
    .typeText('#edit-pass', 'admin')
    .click('#edit-submit');

  // Open hub
  await t.navigateTo('http://localhost/node/add/h5p-content')
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
