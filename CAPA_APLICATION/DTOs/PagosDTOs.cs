using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.DTOs
{
    public class PagosDTOs
    {

        public int PagoId { get; set; }
        public int InscripcionId { get; set; }
        public int MetodoPagoId { get; set; }
        public Decimal Monto { get; set; }
        public int EstadoId { get; set; }
    }
}
