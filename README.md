# Sample Function: QR Code Generator

## Introduction

This repository contains a sample QR code generator function. You can deploy it on DigitalOcean's App Platform as a Serverless Function component.

**Note: This feature is currently in a [limited beta release](https://docs.digitalocean.com/products/platform/product-lifecycle/#beta). Following these steps may result in charges for the use of DigitalOcean services.**

### Requirements

* You need a DigitalOcean account. If you don't already have one, you can sign up at [https://cloud.digitalocean.com/registrations/new](https://cloud.digitalocean.com/registrations/new).
* You need to have access to the beta release of App Platform Serverless Functions. You can sign up for notifications about beta and early access releases [using this form](https://www.digitalocean.com/nimbella).

## Deploying the Function

During the beta, documentation for Serverless Functions will be available to beta participants only in the [Serverless Functions Closed Beta Google Doc](https://docs.google.com/document/d/1qhxnl4ndb0Jh2WkNnNLa2lAUo6u7EAfLyBlUsaPZA0Y). Please refer to this document for instructions on how to deploy Serverless Functions in App Platform.

## Using the Function

This app is a stateless single-page web application that generates a [QR code](https://en.wikipedia.org/wiki/QR_code) from text that a user submits.

This project has the following components:

- A single [`index.html`](./client/index.html) file, which has a field for a visitor to enter some text and click **Submit**.
- A single JavaScript file [`qr.js`](./packages/default/qr/qr.js) that provides the backend logic for the conversion of text to QR code.
- A Node package manager file called [`package.json`](./packages/default/qr/package.json), which describes what dependencies the function has.

### Project File Structure

The GitHub project has the file structure that App Platform uses to intelligently deploy the project:

- The [`packages`](./packages) directory contains the project's API implementation, and in this example, there's only one API implemented by a single function. The first subdirectory name usually serves as the package qualifier. The next subdirectory, [`qr`](./packages/default/qr), is the name of the function, and the file [`qr.js`](./packages/default/qr/qr.js) contains the logic for that function. The qualified name of the function is also the name of the API it implements which is `default/qr` in this case.
- The [`client`](./client) directory contains the static web content for the project. In this case, there is just one HTML file and one image. The [`index.html`](./client/index.html) file contains a form with a text box for the user to input the text that will be converted.

### Notes on QR Logic

The code for the QR action is standard Node.js. It uses an existing Node [library](https://www.npmjs.com/package/qrcode) package for the actual QR code generation.

### Notes on QR Web Content

The [`index.html`](./client/index.html) file contains the usual markup and logic that you'd write for standard web deployment, with an input form for text. In this case, it calls an API to retrieve a QR code for the form input. This API is implemented by [`qr.js`](./packages/default/qr/qr.js).

### Notes on `package.json`

The [`package.json`](./packages/default/qr/package.json) file in the [`qr`](./packages/default/qr) directory triggers an automatic build of the action when the function in [`qr.js`](./packages/default/qr/qr.js) is modified.

### Learn More

You can learn more about App Platform and how to manage and update your application in [the official App Platform Documentation](https://www.digitalocean.com/docs/app-platform/).
