# Sample Function: QR Code Generator

## Introduction

This repository contains a sample QR code generator function. You can deploy it on DigitalOcean's App Platform as a Serverless Function component.
Documentation is available at https://docs.digitalocean.com/products/functions.

### Requirements

* You need a DigitalOcean account. If you don't already have one, you can sign up at [https://cloud.digitalocean.com/registrations/new](https://cloud.digitalocean.com/registrations/new).
* To deploy from the command line, you will need the [DigitalOcean `doctl` CLI](https://github.com/digitalocean/doctl/releases).

## Deploying the Function

```
# clone this repo
git clone git@github.com:digitalocean/sample-functions-nodejs-qrcode.git
```

```
# deploy the project
> doctl serverless deploy sample-functions-nodejs-qrcode
Deploying 'sample-functions-nodejs-qrcode'
  to namespace 'fn-...'
  on host 'https://faas-...'
Started running npm install --production in sample-functions-nodejs-qrcode/default/qr
Finished running npm install --production in sample-functions-nodejs-qrcode/default/qr
...

Deployed functions ('doctl sbx fn get <funcName> --url' for URL):
  - qr
```

## Using the Function

```
> doctl serverless functions invoke qr -p text:hello
{
  "body": "data:image/png;base64,iVB...5CYII=",
  "headers": {
    "content-type": "text/html; charset=UTF-8"
  }
}
```

### Project File Structure

This app is a stateless single-page web application that generates a [QR code](https://en.wikipedia.org/wiki/QR_code) from text that a user submits.

This project has the following components:

- A single [`index.html`](./client/index.html) file, which has a field for a visitor to enter some text and click **Submit**.
- A single JavaScript file [`qr.js`](./packages/default/qr/qr.js) that provides the backend logic for the conversion of text to QR code.
- A Node package manager file called [`package.json`](./packages/default/qr/package.json), which describes what dependencies the function has.

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

You can learn more about Functions and App Platform integration in [the official App Platform Documentation](https://www.digitalocean.com/docs/app-platform/).
