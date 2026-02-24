using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IMetodosPagoRepository
    {

        Task<IEnumerable<MetodosPago>> ListarMetodosPagoAsync();

        Task<IEnumerable<MetodosPago>> ListarMetodosPagoPorNombreAsync();
        Task NuevoMetodosPagoAsync(MetodosPago metodosPago);
        Task EditarMetodosPagoAsync(MetodosPago metodosPago);

        Task EliminarMetodosPagoAsync(int Id);



    }
}
