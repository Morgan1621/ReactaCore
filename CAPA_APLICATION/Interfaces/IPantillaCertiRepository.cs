using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IPantillaCertiRepository
    {

        Task<IEnumerable<PlantillaCertificado>> ListarPlantillaCertificadoAsync();

        Task<IEnumerable<PlantillaCertificado>> ListarPlantillaCertificadoPorNombreAsync();
        Task NuevoPlantillaCertificadoAsync(PlantillaCertificado plantillaCertificado);
        Task EditarPlantillaCertificadoAsync(PlantillaCertificado plantillaCertificado);

        Task EliminarPlantillaCertificadoAsync(int Id);

    }
}
