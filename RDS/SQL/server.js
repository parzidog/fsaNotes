const { dirname } = require('path');
const pg = require('pg');
const client = new pg.Client(`postgres://localhost/${dirname}`)
const fs = require('fs');
const { isBuffer } = require('util');

const readFile = (file) =>{
    return new Promise((resolve, reject)=>{
        fs.readFile(file,(err, data)=>{
            if(err){
                reject(err);
            }
            else {
                resolve(data.toString());
            }
        });
    });
};

const init = async() => {
    try{
        console.log('starting');
        await client.connect();
        const SQL = await fs.readFile('seed.sql');
        client.query(SQL);

        fs.readFile('/seed.sql', async(err, data)=> {
            if(err){
                console.log('error:',err);
            }
            else{
                console.log(data.toString());
                await client.query(data.toString);
            }
        })
    }
    catch(ex){
        console.log(ex);
    }
}

init();