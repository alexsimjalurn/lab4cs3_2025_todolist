from pydantic import BaseModel
from datetime import datetime
from typing import Optional

class TodoBase(BaseModel):
    title: str

class TodoCreate(TodoBase):
    pass

class TodoResponse(TodoBase):
    id: int
    is_done: bool
    created_at: datetime

    class Config:
        from_attributes = True

class TodoUpdate(BaseModel):
    is_done: Optional[bool] = None

