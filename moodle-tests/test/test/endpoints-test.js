import { Selector } from 'testcafe';

const basePath = 'http://localhost';
const user = 'admin';
const pass = 'Admin';
const waitForInstall = 30000;

fixture('Integration Test')
  .page(`${basePath}/login/index.php`);

test('Test endpoints through UI', async t => {

  // Enter login data
  await t.typeText('#username', user)
    .typeText('#password', pass)
    .click('#loginbtn');

  // Create course
  await t.navigateTo('http://localhost/course/modedit.php?add=hvp&type=&course=2&section=0&return=0&sr=0')
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
  await t.expect(installButton.hasClass('hidden')).ok('Detailed view should hide install button')
    .expect(useButton.hasClass('hidden')).notOk('Detailed viw should show use button');
});
