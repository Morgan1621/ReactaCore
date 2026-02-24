using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IBitacoraRepository
    {


        Task<IEnumerable<Bitacora>> ListarBitacoraAsync();

        Task<IEnumerable<Bitacora>> ListarBitacoraPorNombreAsync();
        Task NuevoBitacoraAsync(Bitacora bitacora);
        Task EditarBitacoraAsync(Bitacora bitacora);

        Task EliminarBitacoraAsync(int Id);
    }
}
