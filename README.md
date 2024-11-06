virtualenv venv

.venv/Scripts/activate

pip install -r requirements.txt

Streamlit run app.py



## Set up ngrok to share the local app to co worker

1. download ngrok
2. environment variable -> Path -> Edit -> C:\ngrok
3. cmd -> ngrok http http://localhost:8501

    3.1 first time
        ngrok config add-authtoken $YOUR_AUTHTOKEN
    
    ref: https://dashboard.ngrok.com/get-started/your-authtoken

4. share your forwarding port to co-worker

It will show warning

To remove this page:
Set and send an ngrok-skip-browser-warning request header with any value.

Or, set and send a custom/non-standard browser User-Agent request header.

Or, please upgrade to any paid ngrok account.
