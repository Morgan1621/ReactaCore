using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IPagoRepository
    {

        Task<IEnumerable<Pagos>> ListarPagoAsync();

        Task<IEnumerable<Pagos>> ListarPagoPorNombreAsync();
        Task NuevoPagoAsync(Pagos pagos);
        Task EditarPagoAsync(Pagos pagos);

        Task EliminarPagoAsync(int Id);



    }
}
