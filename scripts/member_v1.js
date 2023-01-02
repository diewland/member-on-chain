async function main() {
    // Grab the contract factory 
    //used to deploy new smart contracts
    const ftr = await ethers.getContractFactory("MemberV1");

    // Start deployment, returning a promise that resolves to a contract object
    const ctr = await ftr.deploy(); // Instance of the contract
    console.log("Contract deployed to address:", ctr.address);
    console.log("https://mumbai.polygonscan.com/address/" + ctr.address);
    console.log("")
 }

 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });
