module Mongo
  class Collection

    def aggregate(pipeline : Array(Any), options : Document)
    end

    def bulkWrite()
    end

    def copyTo(newCollection : String)
    end

    def count(query : Document, options : Document)
    end

    def countDocuments(query : Document, options : Document)
    end

    def estimatedDocumentCount(options : Document)
    end

    def createIndex(keys : Document, options : Document, commitQuorum : Int32 | String)
    end

    def createIndexes(keys : Array(Document), options : Document, commitQuorum : Int32 | String)
    end

    def dataSize()
    end

    def deleteOne()
    end

    def deleteMany()
    end

    def distinct()
    end

    def drop()
    end

    def dropIndex()
    end

    def dropIndexes()
    end

    def ensureIndex()
    end

    def explain()
    end

    def find(query : Document, projection : Document)
    end

    def findAndModify()
    end

    def findOne(query : Document, projection : Document)
    end

    def findOneAndDelete()
    end

    def findOneAndReplace()
    end

    def findOneAndUpdate()
    end

    def getIndexes()
    end

    def getShardDistribution()
    end

    def getShardVersion()
    end

    def hideIndex()
    end

    def insert()
    end

    def insertOne()
    end

    def insertMany()
    end

    def isCapped()
    end

    def latencyStats()
    end

    def mapReduce()
    end

    def reIndex()
    end

    def remove()
    end

    def renameCollection()
    end

    def replaceOne()
    end

    def save()
    end

    def stats()
    end

    def storageSize()
    end

    def totalIndexSize()
    end

    def totalSize()
    end

    def unhideIndex()
    end

    def update()
    end

    def updateOne()
    end

    def updateMany()
    end

    def watch()
    end

    def validate()
    end
  end
end
