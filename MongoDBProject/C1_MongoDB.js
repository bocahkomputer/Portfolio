//FIT3176 Assignment 1: MongoDB & Cassandra
//C.1. Analysis Using MongoDB
//
//Ans:
//
//C.1.3. Read the queries from C1.4 and create one single field index and one compound (more than one field) index to help speed up at least one query. 
//Single Field Index Code:
db.landmarks.createIndex({theme:"text"})
//Compound Index Code:
db.properties.createIndex({"suburb":1, "address":1})
db.suburbs.createIndex({"suburb":1, "address":1})
//
//C.1.4.1. List the landmarks that had a theme of “School”, for example, but not limited to "Secondary Schools", "Primary Schools", “School - Primary and Secondary Education” etc.
//Explanation: 
//The "text" Single Field Index, which is created on C.1.3., is utilized here to ease the theme/landmark searching process.
//Apart from that, the typical find() function is applied, with "landmarkName" and "theme" set to 1 to display both details, while "_id", which will be displayed by default, is set to 0 to not be displayed. 
//Code:
db.landmarks.find({$text:{$search: "school"}}, {landmarkName:1, theme:1, _id:0})
//
//C.1.4.2. Count the number of properties in each suburb and list all suburbs from highest to lowest property count. 
//Explanation:
//As we are only interested in displaying "suburb" and "propertyCount", only both will be projected/displayed, before sorting them in a descending order to get a list of suburbs arranged from highest to lowest property count.
//Code:
db.suburbs.find({},{"suburb":1, "propertyCount":1, _id:0}).sort({"propertyCount":-1})
//
//C.1.4.3. Using MongoDB Aggregation Pipeline display the Council Area having the second highest average property count. Display the result in the following format with avgPropertyCount rounded to 1 decimal place:
//Explanation:
//In the Aggregation Pipeline, we initially group the "suburbs" based on two elements: "councilArea" which is set as the "id" of the grouping, and "avgPropertyCount", which, as its name suggests, computes the average property count of each suburbs.
//We will then project "councilArea" and "avgPropertyCount", but here, we are rounding off the values of "avgPropertyCount" to one decimal place.
//We then finally sort the suburbs in a descending order to get a list of suburbs with highest to lowest average property count, before skipping the list by 1 (ie starting from the second entry on the list), and setting a limit to 1, to get the suburb with the second highest average property count.
//Code:
db.suburbs.aggregate([{$group:{_id:"$councilArea",avgPropertyCount:{$avg:"$propertyCount"}}},{$project:{"_id":0,"councilArea":"$_id",avgPropertyCount:{$round:["$avgPropertyCount",1]}}},{$sort:{"avgPropertyCount":-1}},{$skip:1},{$limit:1}])
//
//C.1.4.4. List the address, suburb, and postcodes of all properties sold more than once ordered from highest to lowest number of times the property was sold.
//Explanation:
//Here, we begin by projecting (ie choosing to display) "address","postcode", "suburb" and "propertySaleCount", the latter which displays the "size" of the "propertyHistory" array (ie the number of elements in the array, as they actually tell how many times the particular property has been sold).
//We then sort the properties in a descending order, to obtain a list of properties with highest to lowest sale count.
//Code:
db.properties.aggregate([{$project:{"_id":0,"address":1,"postcode":1,"suburb":1,"propertySaleCount":{$size:"$propertyHistory"}}},{$sort:{"propertySaleCount":-1}}])
//
//C.1.5. Add a new field in the properties collection to contain new type values reflecting the following data: 
//Explanation:
//An updateMany() function is required here, as we are planning to update multiple entries/records.
//A "switch case" or "switch branch" is used here, where each property "type" will be updated as per the values they have.
//In case a property "type" is neither a "h", "u", nor "t", it will be set/updated to "other" by default.
//Code:
db.properties.updateMany(
   { },
   [
     { $set: { type: { $switch: {
                           branches: [
                               { case: { $eq: [ "$type", "h" ] }, then: "house" },
                               { case: { $eq: [ "$type", "u" ] }, then: "unit" },
                               { case: { $eq: [ "$type", "t" ] }, then: "town house" }
                           ],
                           default: "other"
     } } } }
   ]
)
//
//C.1.6. Using the landmarks collection find the documents that contain the landmark located on the street named Monash Road and update it to add a new field called homeGround with value true and a new field called team with value yourGroupNo.
//Explanation:
//Here, we use the update() function to create a "homeGround" and "team" fields, set to true and 29, respectively, on "landmarks" with "street" value of "Monash Road".
//Code:
db.landmarks.update({"street": "Monash Road"},{$set: {"homeGround":true, "team":29}})
//
//C.1.7.1. Modify the documents in the suburbs collection so that the landmarks collection is embedded within the suburbs collection for documents that contain landmarks as an array field called landmarks. Store all suburbs containing a Landmark in a new collection called suburbLandmarks.
//Explanation:
//On the Aggregation Pipeline, we perform a Left Join on "suburbs" and "landmarks", joining them based on their "suburb" values.
//We then perform a "match" function, which will find entries/documents without an empty "landmark" array.
//Finally, we store all these documents on a fresh "suburbLandmarks" collection.
//Code:
db.suburbs.aggregate([{$lookup:{from:"landmarks", localField:"suburb",foreignField:"suburb", as:"landmarks"}},{$match:{"landmarks":{$not:{$size:0}}}},{$out:"suburbLandmarks"}])
//
//C.1.7.2. Display the region name with the maximum number of landmarks
//Explanation:
//We initially project "regionLandmarksCount", which represents the number of "landmarks" in each "region", along with the "regionName".
//We then sort the entries/list in a descending order (ie from highest "landmark" count to lowest), before setting a limit of 1 to obtain the "region" with the highest "landmark" count.
//Code:
db.suburbLandmarks.aggregate([{$project:{"_id":0,"regionLandmarksCount":{$size:"$landmarks"},"regionName":1}},{$sort:{"regionLandmarksCount":-1}},{$limit:1}])
//
//C.1.8.1. Using MongoDBShell commands modify the landmarks collections so that all lat and lon location coordinates are in MongoDB GeoJSON objects with location type as a point in a field called location. 
//Store the landmarkName, category, theme and location fields of the modified documents in a new collection called landmarkLocations. 
//Explanation:
//We use the set() function to set/modify the "lat" and "lon" values as GeoJSON points and store them in a new "location" field. 
//We then project/display the "landmarkName", "category", "theme" and "location" we just created, before storing all these entries/documents in a new "landmarkLocations" collection.
//Code:
db.landmarks.aggregate([{$set:{location:{type:"Point",coordinates:["$lon","$lat"],index:"2d"}}},{$project:{"_id":0,"landmarkName":1,"category":1,"theme":1,"location":1}},{$out:"landmarkLocations"}])
//
//C.1.8.3. List all landmark names within 200m of “Melbourne Private Hospital”.
//Explanation:
//The first piece of code creates a "2dspehere" index (via the createIndex() function),which will come in handy for this section.
//The following code performs a find operation, searching for locations/"landmarks" within 200m of "Melbourne Private Hospital", which is described by the longitude and latitude provided. 
//Code:
db.landmarkLocations.createIndex( { location: "2dsphere" } )
db.landmarkLocations.find(
{ location:
{ $near :
{ $geometry: { type: "Point",
coordinates: [ 144.9572884, -37.79831113 ] },
$maxDistance: 200
} } } )




