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
      { "nombre": "Luis López", "documento": "123456002", "fecha_nacimiento": "1996-04-20", "posicion": "Atacante" },
      { "nombre": "Juan David", "documento": "1111193418", "fecha_nacimiento": "1993-12-24", "posicion": "Atacante" },
      { "nombre": "Pedro Martínez", "documento": "123456007", "fecha_nacimiento": "1994-11-12", "posicion": "Central" },
      { "nombre": "Mario Torres", "documento": "123456008", "fecha_nacimiento": "1995-08-08", "posicion": "Opuesto" },
      { "nombre": "José Díaz", "documento": "123456009", "fecha_nacimiento": "1997-02-14", "posicion": "Armador" }
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
      { "nombre": "Laura Díaz", "documento": "123456004", "fecha_nacimiento": "1998-06-25", "posicion": "Armadora" },
      { "nombre": "Sofía García", "documento": "123456010", "fecha_nacimiento": "1999-07-14", "posicion": "Líbero" },
      { "nombre": "Camila Ramírez", "documento": "123456011", "fecha_nacimiento": "1996-12-03", "posicion": "Opuesto" },
      { "nombre": "Isabela Gómez", "documento": "123456012", "fecha_nacimiento": "1995-04-21", "posicion": "Atacante" },
      { "nombre": "Valentina Pérez", "documento": "123456013", "fecha_nacimiento": "1996-09-18", "posicion": "Armadora" }
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
      { "nombre": "Miguel Ruiz", "documento": "123456006", "fecha_nacimiento": "2000-02-15", "posicion": "Líbero" },
      { "nombre": "Andrés Torres", "documento": "123456014", "fecha_nacimiento": "1998-06-20", "posicion": "Central" },
      { "nombre": "Fernando Gómez", "documento": "123456015", "fecha_nacimiento": "1997-09-11", "posicion": "Opuesto" },
      { "nombre": "Santiago Martínez", "documento": "123456016", "fecha_nacimiento": "1996-03-05", "posicion": "Armador" },
      { "nombre": "Jorge Ramírez", "documento": "123456017", "fecha_nacimiento": "1994-12-01", "posicion": "Atacante" }
    ]
  }
]);


//======================> Crear colección para Árbitros <======================//
db.arbitros.insertMany([
  { "nombre": "Alberto Castro", "documento": "100200300", "experiencia": "5 años", "disponibilidad": ["2024-11-20", "2024-11-22"] },
  { "nombre": "Sofía Moreno", "documento": "200300400", "experiencia": "7 años", "disponibilidad": ["2024-11-21", "2024-11-23"] },
  { "nombre": "Jorge Rojas", "documento": "300400500", "experiencia": "3 años", "disponibilidad": ["2024-11-22", "2024-11-24"] }
]);


//======================> Crear colección para Encuentros <======================//

db.encuentros.insertMany([
  {
    "equipo_local": "Tiburones",
    "equipo_visitante": "Águilas",
    "fecha": "2024-11-20",
    "hora": "10:00",
    "lugar": "Coliseo Central",
    "arbitro": "Alberto Castro"
  },
  {
    "equipo_local": "Leones",
    "equipo_visitante": "Tiburones",
    "fecha": "2024-11-21",
    "hora": "14:00",
    "lugar": "Coliseo Norte",
    "arbitro": "Sofía Moreno"
  }
]);

//======================> Crear colección para Resultados <======================//

db.resultados.insertMany([
  {
    "encuentro_id": ObjectId("6739092976ecfa71e839bfec"), // ID del primer encuentro
    "set_local": [25, 23, 25],
    "set_visitante": [15, 25, 20],
    "ganador": "Tiburones"
  },
  {
    "encuentro_id": ObjectId("6739092976ecfa71e839bfeb"), // ID del segundo encuentro 
    "set_local": [15, 23, 20],
    "set_visitante": [25, 25, 25],
    "ganador": "Águilas"
  }
]);

//======================> Crear colección para Tabla de Posiciones <======================//

db.tabla_posiciones.insertMany([
  { "equipo_id": "Tiburones", "partidos_jugados": 2, "victorias": 1, "derrotas": 1, "puntos": 3 },
  { "equipo_id": "Águilas", "partidos_jugados": 2, "victorias": 2, "derrotas": 0, "puntos": 6 },
  { "equipo_id": "Leones", "partidos_jugados": 1, "victorias": 0, "derrotas": 1, "puntos": 0 }
]);


//======================> Consultas <======================//
// consultas de las colecciones
db.equipos.find(); 

db.tabla_posiciones.find();

db.tabla_posiciones.find();

// Consulta para obtener todos los jugadores de cada equipo
db.equipos.find(
  {},
  {
    nombre: 1,
    "jugadores.nombre": 1,
    "jugadores.documento": 1,
    "jugadores.posicion": 1
  }
);


// Consulta que se usa para obtener la tabla de posiciones ordenada por puntos (de mayor a menor):
db.tabla_posiciones.find().sort({ puntos: -1 });

//Consulta para obtener los resultados en los que participó un equipo específico (por ejemplo, "Tiburones"):
db.resultados.aggregate([
  {
    $lookup: {
      from: "encuentros",
      localField: "encuentro_id",
      foreignField: "_id",
      as: "detalle_encuentro"
    }
  },
  {
    $match: {
      $or: [
        { "detalle_encuentro.equipo_local": "Tiburones" },
        { "detalle_encuentro.equipo_visitante": "Tiburones" }
      ]
    }
  },
  {
    $project: {
      _id: 0,
      encuentro_id: 1,
      "detalle_encuentro.fecha": 1,
      "detalle_encuentro.equipo_local": 1,
      "detalle_encuentro.equipo_visitante": 1,
      set_local: 1,
      set_visitante: 1,
      ganador: 1
    }
  }
]);

// Consulta para obtener todos los encuentros arbitrados por un árbitro específico (por ejemplo, "Alberto Castro"):
db.encuentros.find(
  { arbitro: "Alberto Castro" },
  {
    _id: 0,
    fecha: 1,
    hora: 1,
    lugar: 1,
    equipo_local: 1,
    equipo_visitante: 1
  }
);

