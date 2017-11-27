import { Selector } from 'testcafe';

const basePath = 'http://localhost';
const user = 'admin';
const pass = 'admin';
const waitForInstall = 30000;

fixture('Drupal integration test')
  .page(basePath);

test('just checks if the page exists', async t => {

  // Enter login data
  await t.typeText('#edit-name', user)
    .typeText('#edit-pass', pass)
    .click('#edit-submit');

  // Add h5p content page
  await t.navigateTo('http://localhost/node/add/h5p-content')
    .switchToIframe('.h5p-editor-iframe');

  // Open hub client
  const hubPanel = await Selector('.icon-hub-icon');
  await t.expect(hubPanel).ok('Hub is showing up')
    .click(hubPanel);

  // Enter detailed view of first content type
  const firstContentType = await Selector('.content-type-list li:first-child');
  await t.expect(firstContentType).ok('Content type list has at least one library')
    .click(firstContentType);

  // Install content type
  const installButton = await Selector('.content-type-detail .button.button-install');
  await t.expect(installButton.hasClass('hidden')).notOk('Detailed view has an install button')
    .click(installButton);

  // wait for content type to install
  await t.wait(waitForInstall);

  // Check that install button is replaced by use button
  const useButton = await Selector('.content-type-detail .button.button-use');
  await t.expect(useButton.hasClass('hidden')).notOk('Detailed viw should show use button');
});
