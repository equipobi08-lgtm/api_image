from fastapi import FastAPI, HTTPException
from playwright.sync_api import sync_playwright
import base64
from io import BytesIO

app = FastAPI()

@app.get("/screenshot")
def screenshot(url: str):
    if not url.startswith("http"):
        raise HTTPException(status_code=400, detail="Invalid URL")

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)  # modo headless
        page = browser.new_page()
        page.goto(url)
        
        # Tomar screenshot en memoria (BytesIO)
        screenshot_bytes = page.screenshot()
        browser.close()

    # Codificar a base64
    encoded = base64.b64encode(screenshot_bytes).decode("utf-8")
    return {"screenshot": encoded}
