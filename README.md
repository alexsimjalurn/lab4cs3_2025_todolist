# ແອັບພລິເຄຊັນລາຍການເຮັດວຽກ (To-Do List)

ແອັບພລິເຄຊັນລາຍການເຮັດວຽກທີ່ໃຊ້ Flutter + FastAPI + PostgreSQL.

## ການຕັ້ງຄ່າ Backend

1. ຕິດຕັ້ງ dependencies:
```bash
#Python 3.12.x
cd backend
pip install -r requirements.txt
```

2. ສ້າງຖານຂໍ້ມູນ PostgreSQL:
```bash
# ທາງເລືອກທີ 1: ລັນ Python script (ຕ້ອງການ psycopg2)
python setup_database.py

# ທາງເລືອກທີ 2: ໃຊ້ຄຳສັ່ງ psql
psql -U postgres -c "CREATE DATABASE tododb;"

# ທາງເລືອກທີ 3: ໃຊ້ SQL script
psql -U postgres -f create_database.sql
```

URL ຖານຂໍ້ມູນໄດ້ຖືກຕັ້ງຄ່າໃນ `database.py` ແລ້ວ:
```
postgresql://postgres:mini929203@localhost:5432/tododb
```

3. ລັນ FastAPI server:
```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

Backend ຈະພ້ອມໃຊ້ງານທີ່ `http://localhost:8000`

## ການຕັ້ງຄ່າ Frontend

1. ຕິດຕັ້ງ Flutter dependencies:
```bash
flutter pub get
```

2. ອັບເດດ API base URL ໃນ `lib/todo_service.dart` ຖ້າຈຳເປັນ:
- Android Emulator: `http://10.0.2.2:8000` (ຄ່າເລີ່ມຕົ້ນ)
- iOS Simulator: `http://localhost:8000` ຫຼື `http://127.0.0.1:8000`
- ອຸປະກອນຈິງ: `http://YOUR_COMPUTER_IP:8000`

3. ແລ່ນ Flutter app:
```bash
flutter run
```

## API Endpoints

- `GET /todos` - ເກັບລາຍການເຮັດວຽກທັງໝົດ
- `POST /todos` - ສ້າງລາຍການເຮັດວຽກ (body: `{"title": "string"}`)
- `PUT /todos/{id}` - ປ່ຽນສະຖານະການເຮັດສຳເລັດລາຍການເຮັດວຽກ
- `DELETE /todos/{id}` - ລຶບລາຍການເຮັດວຽກ
