function status(request, response) {
  response.status(200).json({ teste: "teste de acentuação" });
}

export default status;
