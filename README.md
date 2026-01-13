# To-Do List Application

Flutter + FastAPI + PostgreSQL To-Do List application.

## Backend Setup

1. Install dependencies:
```bash
cd backend
pip install -r requirements.txt
```

2. Create PostgreSQL database:
```bash
# Option 1: Run Python script (requires psycopg2)
python setup_database.py

# Option 2: Using psql command line
psql -U postgres -c "CREATE DATABASE tododb;"

# Option 3: Using SQL script
psql -U postgres -f create_database.sql
```

The database URL is already configured in `database.py`:
```
postgresql://postgres:mini929203@localhost:5432/tododb
```

3. Run FastAPI server:
```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

Backend will be available at `http://localhost:8000`

## Frontend Setup

1. Install Flutter dependencies:
```bash
flutter pub get
```

2. Update API base URL in `lib/todo_service.dart` if needed:
- Android Emulator: `http://10.0.2.2:8000` (default)
- iOS Simulator: `http://localhost:8000` or `http://127.0.0.1:8000`
- Physical device: `http://YOUR_COMPUTER_IP:8000`

3. Run Flutter app:
```bash
flutter run
```

## API Endpoints

- `GET /todos` - Get all todos
- `POST /todos` - Create todo (body: `{"title": "string"}`)
- `PUT /todos/{id}` - Toggle todo completion
- `DELETE /todos/{id}` - Delete todo

