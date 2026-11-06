# Safe Signal 🚨

> 🏆 **Hackiest Hack Award, Kent-HackIt 2026 (Hackathons UK)**. Built by a team in 24 hours.

Safe Signal is a one-button emergency alert device. You press a button on a Raspberry Pi 1, 2 or 3 times, and your three trusted contacts instantly get an SMS with your name, a Google Maps link to your location and the time:

| Presses | Alert sent |
|---|---|
| 1 | **Family alert** |
| 2 | **Police needed** |
| 3 | **Medical emergency**, including the user's saved medical notes |

A web app lets the device owner register, set their emergency contacts and medical notes, and see a dashboard of every alert sent.

## How it works

```
[ Raspberry Pi button ] --HTTP--> [ Flask API (via ngrok tunnel) ] --Twilio--> SMS to 3 contacts
                                          ^
                    [ Web frontend: register · contacts · dashboard ]
```

- **`raspberrypi/`**: counts button presses in a short time window and posts the alert to the API.
- **`backend/`**: Flask REST API (`/register`, `/login`, `/alert`, `/alerts`, `/user/<id>`, `/ping`). It validates input, hashes passwords, stores users and alerts, and sends SMS through the Twilio API. On start-up it opens an ngrok tunnel and sends the public URL to the Pi.
- **`Frontend/`**: HTML, CSS and vanilla JavaScript pages for registration, emergency contacts, login and the alert dashboard.

## Tech stack

Python · Flask · Flask-CORS · Twilio API · ngrok · Raspberry Pi · HTML/CSS/JavaScript

## Running it

```bash
cd backend
pip install -r requirements.txt
```

Create `backend/server/.env`. It is git-ignored, so your credentials are never committed:

```env
TWILIO_SID=your-account-sid
TWILIO_TOKEN=your-auth-token
TWILIO_NUM=+44xxxxxxxxxx
NGROK_AUTHTOKEN=your-ngrok-token
```

Then start the server and open `Frontend/Homepage.html` in a browser:

```bash
python server_start.py
```

To deploy the device code to the Pi, set `PI_HOST` and `SSHPASS` in your shell and run `./transfer_to_pi.sh`.

## Team and my role

Built at Kent-HackIt 2026 with [m1k0103](https://github.com/m1k0103), who worked on the Raspberry Pi and backend. **My contribution ([Hassan Ali](https://github.com/Hassan6237)):** I built the web frontend (registration, emergency-contacts setup, login and dashboard) and connected it to the Flask API.

## Licence

Apache 2.0. See [LICENSE](LICENSE).
