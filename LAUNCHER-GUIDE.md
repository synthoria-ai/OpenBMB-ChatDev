# ChatDev Launcher Guide

This guide explains how to easily launch ChatDev using the provided shortcuts and launchers.

## 🚀 Quick Launch Methods

### Method 1: Command Line Launcher (Recommended)

The easiest way to run ChatDev:

```bash
cd /home/user/OpenBMB-ChatDev
./chatdev-launcher.sh "Your app description" "AppName"
```

**Examples:**
```bash
# Create a calculator app
./chatdev-launcher.sh "Create a calculator with basic operations" "Calculator"

# Create a todo list
./chatdev-launcher.sh "Create a todo list app" "TodoList"

# Create a game
./chatdev-launcher.sh "Create a snake game" "SnakeGame"
```

### Method 2: Web Launcher (Visual Interface)

Open the HTML launcher in your browser:

```bash
# Open in default browser
xdg-open /home/user/OpenBMB-ChatDev/chatdev-web-launcher.html

# Or with a specific browser
firefox /home/user/OpenBMB-ChatDev/chatdev-web-launcher.html
google-chrome /home/user/OpenBMB-ChatDev/chatdev-web-launcher.html
```

This provides a visual interface with examples and quick commands.

### Method 3: Desktop Shortcut (Linux)

**Option A: Copy to Desktop**
```bash
cp /home/user/OpenBMB-ChatDev/ChatDev.desktop ~/Desktop/
chmod +x ~/Desktop/ChatDev.desktop
```

**Option B: Install System-Wide**
```bash
cp /home/user/OpenBMB-ChatDev/ChatDev.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications/
```

After installation, you can find "ChatDev" in your application menu.

### Method 4: Create an Alias (Terminal)

Add this to your `~/.bashrc` or `~/.zshrc`:

```bash
alias chatdev='cd /home/user/OpenBMB-ChatDev && ./chatdev-launcher.sh'
```

Then reload your shell:
```bash
source ~/.bashrc  # or source ~/.zshrc
```

Now you can run ChatDev from anywhere:
```bash
chatdev "Create a weather app" "WeatherApp"
```

## 📂 Where Are My Apps?

All created applications are saved in:
```
/home/user/OpenBMB-ChatDev/WareHouse/
```

Each app gets its own folder with timestamp:
```
WareHouse/
├── AppName_DefaultOrganization_TIMESTAMP/
│   ├── main.py           # Main application file
│   ├── manual.md         # User manual
│   ├── requirements.txt  # Dependencies
│   └── ...              # Other files
```

## 🎮 Running Your Apps

To run any created app:

```bash
cd WareHouse/YourAppName_DefaultOrganization_TIMESTAMP/
../../venv/bin/python main.py
```

## ⚙️ Advanced Options

### Use GPT-4 (Higher Quality, More Expensive)
```bash
./venv/bin/python run.py --task "Your task" --name "AppName" --model GPT_4
```

### Use Custom Configuration
```bash
./venv/bin/python run.py --task "Your task" --name "AppName" --config Custom
```

### Specify Organization Name
```bash
./venv/bin/python run.py --task "Your task" --name "AppName" --org "MyCompany"
```

## 🔑 API Key Management

Your OpenAI API key is stored in:
```
/home/user/OpenBMB-ChatDev/.env
```

To update it, edit the `.env` file:
```bash
nano /home/user/OpenBMB-ChatDev/.env
```

## 🐛 Troubleshooting

**Problem: "Permission denied" when running launcher**
```bash
chmod +x /home/user/OpenBMB-ChatDev/chatdev-launcher.sh
```

**Problem: "OPENAI_API_KEY not found"**
- Check that `.env` file exists and contains your API key
- Verify the key format: `OPENAI_API_KEY=sk-...`

**Problem: "ModuleNotFoundError: No module named 'tkinter'"**
```bash
# Install tkinter
sudo apt-get install python3-tk  # Ubuntu/Debian
```

**Problem: App won't run**
- Make sure you're in the app directory
- Use the virtual environment: `../../venv/bin/python main.py`
- Check requirements: `../../venv/bin/pip install -r requirements.txt`

## 📚 Additional Resources

- **Main README**: `/home/user/OpenBMB-ChatDev/README.md`
- **Wiki**: `/home/user/OpenBMB-ChatDev/wiki.md`
- **Example App**: `/home/user/OpenBMB-ChatDev/WareHouse/Calculator_DefaultOrganization_20260111183501/`

## 🎉 Quick Tips

1. **Keep descriptions clear**: The better your task description, the better the app
2. **Check the WareHouse**: All apps are automatically saved with logs
3. **Read the manual**: Each app includes a `manual.md` with instructions
4. **Test incrementally**: Start with simple apps to learn the system

Enjoy creating apps with ChatDev! 🚀
