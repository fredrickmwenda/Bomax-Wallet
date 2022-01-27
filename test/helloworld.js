const { contracts_build_directory } = require("../truffle-config")

const HelloWorld = artificats.require('Hello World')

contracts_build_directory()
contracts("Hello world", () =>{
    it("First Solidity test", async() =>{
        const helloWorld = await HelloWorld.deployed()
        await helloWorld.setName("Fredrick Mwenda")
        const yourName = await HelloWorld.yourName()
        assert(result === "Fredrick Mwenda")
    })
})