def _save_dataset( message ):
    try:
        with open('DZRecord2.log', 'w') as outfile:
            outfile.write(message)
        Scribe.Send( "DarkZagreus: DZStyxScribeSaveTrainingDataCallback: " + "true" )
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")
        Scribe.Send( "DarkZagreus: DZStyxScribeSaveTrainingDataCallback: " + "false" )

def _load_dataset( message ):
    # read the content of DZRecord.log
    try:
        with open('DZRecord.log', 'r') as file:
            message = file.read()
        
        Scribe.Send( "DarkZagreus: DZStyxScribeLoadTrainingDataCallback: " + message )
    except FileNotFoundError:
        print(f"File not found: DZRecord.log")
        return None
    except IOError as e:
        print(f"An error occurred while reading the file: {e}")
        return None

Priority = 0

def Load():
    Scribe.AddHook(_load_dataset, "DarkZagreus: DZStyxScribeLoadTrainingData: ", __name__)
    Scribe.AddHook(_save_dataset, "DarkZagreus: DZStyxScribeSaveTrainingData: ", __name__)
    Scribe.IgnorePrefixes.append("DarkZagreus: DZStyxScribeLoadTrainingDataCallback: ")
    Scribe.IgnorePrefixes.append("DarkZagreus: DZStyxScribeSaveTrainingDataCallback: ")