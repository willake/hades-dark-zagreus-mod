def _load_dataset( message ):
    # do something with the message
    # the message will have the prefix removed already

    # Read the content of DZRecord.log
    with open('DZRecord.log', 'r') as file:
        message = file.read()
        
    # example: sending back the same message
    Scribe.Send( "DarkZagreus: DZStyxScribeLoadTrainingDataCallback: " + message )

Priority = 0

def Load():
    Scribe.AddHook(_load_dataset, "DarkZagreus: DZStyxScribeLoadTrainingData: ", __name__)
    Scribe.IgnorePrefixes.append("DarkZagreus: DZStyxScribeLoadTrainingDataCallback: ")