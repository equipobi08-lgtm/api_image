from fastapi import FastAPI, Query
from fastapi.responses import JSONResponse
from playwright.async_api import async_playwright
import uuid
import base64
import os

app = FastAPI()

@app.get("/screenshot")
async def screenshot(url: str = Query(..., description="URL de la página a capturar")):
    filename = f"screenshot_{uuid.uuid4()}.png"
    
    async with async_playwright() as p:
        browser = await p.chromium.launch()
        context = await browser.new_context()
        page = await context.new_page()
        await page.goto(url)
        await page.screenshot(path=filename, full_page=True)
        await browser.close()

    # Leer el archivo y codificarlo a base64
    with open(filename, "rb") as image_file:
        encoded_string = base64.b64encode(image_file.read()).decode('utf-8')

    # Borrar el archivo para no dejar basura
    os.remove(filename)

    # Devolver la imagen en base64 en un JSON
    return JSONResponse(content={"image_base64": encoded_string})