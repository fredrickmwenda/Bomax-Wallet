const HelloWorld = artifacts.require("HelloWorld")
//exports
module.exports = function (deployer) {
    deployer.deploy(HelloWorld)
}