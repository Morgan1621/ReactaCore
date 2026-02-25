using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class CertificadoServices
    {


        private readonly ICertificadoRepository _RepositoryCertificado;

        public CertificadoServices(ICertificadoRepository repository)
        {
            _RepositoryCertificado = repository;
        }

        //Listar eVENTO //



        public async Task<IEnumerable<CertificadosDTOs>> ListarEvento()
        {
            var listar = await _RepositoryCertificado.ListarCertificadoAsync();

            return listar.Select(p => new CertificadosDTOs
            {
                CertificadoId = p.CertificadoId,
                AsistenteId = p.AsistenteId,
                PlantillaId = p.PlantillaId,
                FechaEmision = p.FechaEmision,
               
            });
        }

        public async Task<IEnumerable<CertificadosDTOs>> ListarNombreCertificado(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<CertificadosDTOs>();

            var lista = await _RepositoryCertificado.ListarCertificadoPorNombreAsync();

            return lista.Select(p => new CertificadosDTOs
            {
                CertificadoId = p.CertificadoId,
                AsistenteId = p.AsistenteId,
                PlantillaId = p.PlantillaId,
                FechaEmision = p.FechaEmision,

            });

        }
    }
}
