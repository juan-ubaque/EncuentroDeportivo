//======================> Crear colección para Equipos <======================//
db.equipos.insertMany([
  {
    "nombre": "Tiburones",
    "entrenador": {
      "nombre": "Carlos Pérez",
      "documento": "123456789",
      "experiencia": "5 años"
    },
    "jugadores": [
      { "nombre": "Juan García", "documento": "123456001", "fecha_nacimiento": "1995-03-15", "posicion": "Líbero" },
      { "nombre": "Luis López", "documento": "123456002", "fecha_nacimiento": "1996-04-20", "posicion": "Atacante" }
    ]
  },
  {
    "nombre": "Águilas",
    "entrenador": {
      "nombre": "María Gómez",
      "documento": "223344556",
      "experiencia": "8 años"
    },
    "jugadores": [
      { "nombre": "Ana Torres", "documento": "123456003", "fecha_nacimiento": "1997-05-10", "posicion": "Central" },
      { "nombre": "Laura Díaz", "documento": "123456004", "fecha_nacimiento": "1998-06-25", "posicion": "Armadora" }
    ]
  },
  {
    "nombre": "Leones",
    "entrenador": {
      "nombre": "Pedro Ramírez",
      "documento": "345678910",
      "experiencia": "10 años"
    },
    "jugadores": [
      { "nombre": "Carlos Ortega", "documento": "123456005", "fecha_nacimiento": "1999-01-30", "posicion": "Opuesto" },
      { "nombre": "Miguel Ruiz", "documento": "123456006", "fecha_nacimiento": "2000-02-15", "posicion": "Líbero" }
    ]
  }
]);


//======================> Crear colección para Árbitros <======================//
db.arbitros.insertMany([
  { "nombre": "Alberto Castro", "documento": "100200300", "experiencia": "5 años", "disponibilidad": ["2024-11-20", "2024-11-22"] },
  { "nombre": "Sofía Moreno", "documento": "200300400", "experiencia": "7 años", "disponibilidad": ["2024-11-21", "2024-11-23"] },
  { "nombre": "Jorge Rojas", "documento": "300400500", "experiencia": "3 años", "disponibilidad": ["2024-11-22", "2024-11-24"] }
]);
