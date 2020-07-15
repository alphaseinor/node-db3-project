const db = require('../data/dbconfig')

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
}

function find(){
  return db("schemes")
}

function findById(id){
  return db("schemes")
          .where({id})
          .first()

}

function findSteps(id){
  return db("steps")
          .orderBy("step_number")
          .join("schemes", "steps.scheme_id", "schemes_id")
          .where("schemes.id", id)
}

function add(scheme){
  return db("schemes")
          .insert(scheme, "id")
          .then(id => {
            return findById(id[0])
          })
}

function update(change, id){
  return db("schemes")
          .where({id})
          .update(change)
          .then(() => {
            return findById(id)
          })
}

async function remove(id){
  const found = await findById(id)
  return db("schemes")
          .where({id})
          .delete()
          .then(() => {
            return found
          })
}
