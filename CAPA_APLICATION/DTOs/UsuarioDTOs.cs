using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.DTOs
{
    public class UsuarioDTOs
    {

        public int UsuarioId { get; set; }
        public string Nombre { get; set; }
        public string Correo { get; set; }
        public int RolId { get; set; }
        public int EstadoId { get; set; }
    }
}
